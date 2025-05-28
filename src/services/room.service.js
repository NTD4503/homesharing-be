const knex = require("../config/knex");

const retrieveTypeList = async () => {
  return await knex.select("*").from("room_type");
};

const retrieveById = async (roomId) => {
  return await knex.select("*").from("room").where("room_id", roomId);
};

const getDistanceInKm = (lat1, lng1, lat2, lng2) => {
  const toRad = (value) => (value * Math.PI) / 180;
  const R = 6371; // Bán kính Trái Đất (km)
  const dLat = toRad(lat2 - lat1);
  const dLng = toRad(lng2 - lng1);
  const a =
    Math.sin(dLat / 2) ** 2 +
    Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) * Math.sin(dLng / 2) ** 2;
  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  return R * c;
};

const retrieveByCriteria = async (criteria) => {
  console.log("Received roomservice criteria:", criteria);
  try {
    let query = knex("room")
      .select("room.room_id", "room.lat", "room.lng") // Thêm lat/lng để lọc sau
      .leftJoin("room_detail", "room.room_id", "room_detail.room_id")
      .leftJoin("room_type", "room_detail.room_type_id", "room_type.room_type_id");

    // ====== LỌC GIÁ ======
    if (criteria.min_price !== undefined && criteria.max_price !== undefined) {
      if (parseInt(criteria.min_price) === 0) {
        query = query.where("price", "<", criteria.max_price * 1000000);
      } else if (criteria.min_price === criteria.max_price) {
        query = query.where("price", ">=", criteria.max_price * 1000000);
      } else {
        query = query.whereBetween("price", [
          criteria.min_price * 1000000,
          criteria.max_price * 1000000,
        ]);
      }
    }

    // ====== LỌC DIỆN TÍCH ======
    if (criteria.min_area !== undefined && criteria.max_area !== undefined) {
      if (parseInt(criteria.min_area) === 0) {
        query = query.where("area", "<", criteria.max_area);
      } else if (criteria.min_area === criteria.max_area) {
        query = query.where("area", ">=", criteria.max_area);
      } else {
        query = query.whereBetween("area", [criteria.min_area, criteria.max_area]);
      }
    }

    // ====== LỌC ĐỊA ĐIỂM ======
    if (criteria.location_codes && criteria.location_codes.length > 0) {
      for (let i = 0; i < criteria.location_codes.length; i++) {
        const locationCode = criteria.location_codes[i];
        query = query.whereRaw(`location_codes[${i + 1}] = ?`, [locationCode]);
      }
    }

    // ====== LỌC LOẠI PHÒNG ======
    if (criteria.room_type_name && criteria.room_type_name !== "all") {
      query = query.where("room_type.room_type_name", criteria.room_type_name);
    }

    // ====== LỌC GIỚI TÍNH ======
    if (criteria.gender && criteria.gender !== "") {
      query = query.where("room_detail.gender", criteria.gender);
    }

    // ====== SẮP XẾP ======
    if (criteria.sort_type && criteria.order) {
      const validSortTypes = ["price", "area"];
      const validOrders = ["asc", "desc"];
      if (validSortTypes.includes(criteria.sort_type) && validOrders.includes(criteria.order)) {
        query = query.orderBy(criteria.sort_type, criteria.order);
      }
    }

    const filteredRooms = await query;

    // ====== LỌC THEO BÁN KÍNH (nếu có lat/lng) ======
    let finalRoomIds = filteredRooms.map((room) => room.room_id);

    if (criteria.lat && criteria.lng && criteria.radius_km) {
      finalRoomIds = filteredRooms
        .filter((room) => {
          if (!room.lat || !room.lng) {
            console.warn(`Phòng ${room.room_id} bị thiếu tọa độ`);
            return false;
          }

          const distance = getDistanceInKm(criteria.lat, criteria.lng, room.lat, room.lng);
          console.log(`Phòng ${room.room_id} cách ${distance.toFixed(2)} km`);
          return distance <= criteria.radius_km;
        })
        .map((room) => room.room_id);
    }

    return finalRoomIds;
  } catch (error) {
    console.log(error);
    throw error;
  }
};


const retrieveByArea = async (areaCodes) => {
  try {
    let query = knex("room")
      .select("room.room_id")
      .leftJoin("room_detail", "room.room_id", "room_detail.room_id")
      .leftJoin(
        "room_type",
        "room_detail.room_type_id",
        "room_type.room_type_id"
      );

    for (let i = 0; i < areaCodes.length; i++) {
      const locationCode = areaCodes[i];
      query = query.whereRaw(`location_codes[${i + 1}] = ?`, [locationCode]);
    }

    const filteredRooms = await query;

    const roomIds = filteredRooms.map((room) => room.room_id);

    return roomIds;
  } catch (error) {
    console.log(error);
    throw error;
  }
};

const save = async (roomData) => {
  const roomId = await knex("room").insert(roomData).returning("room_id");
  return roomId[0];
};

const update = async (newData, roomId) => {
  await knex("room").where("room_id", roomId).update(newData);
};

const remove = async (roomId) => {
  await knex("room").where("room_id", roomId).del();
};

const getRoomsWithLocation = async (roomIds) => {
  return await knex("room")
    .select("room_id", "lat", "lng")
    .whereIn("room_id", roomIds);
};

module.exports = {
  retrieveTypeList,
  retrieveById,
  retrieveByCriteria,
  retrieveByArea,
  save,
  update,
  remove,
  getRoomsWithLocation,
};
