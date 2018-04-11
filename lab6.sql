--2
SELECT full_name, phone FROM room_in_reservation
LEFT JOIN room r ON room_in_reservation.id_room = r.id_room
LEFT JOIN room_kind kind ON r.room_kind_id = kind.room_kind_id
LEFT JOIN hotel h ON r.hotel_id = h.hotel_id
LEFT JOIN reservation r2 ON room_in_reservation.id_reservation = r2.id_reservation
LEFT JOIN client c2 ON r2.id_client = c2.id_client
WHERE hotel_name = "Алтай" AND kind.name = "люкс";

--3
SELECT number_of_room_in_hotel FROM room_in_reservation
RIGHT JOIN room r ON room_in_reservation.id_room = r.id_room
LEFT JOIN hotel h ON r.hotel_id = h.hotel_id
WHERE "2012-05-30" NOT BETWEEN room_in_reservation.date_of_arrival AND room_in_reservation.date_of_departure OR room_in_reservation.id_room is NULL;

--4
SELECT COUNT(room_in_reservation.id_room_in_reservation) FROM room_in_reservation
LEFT JOIN room r ON room_in_reservation.id_room = r.id_room
LEFT JOIN hotel h ON r.hotel_id = h.hotel_id
WHERE h.hotel_name = 'Восток' AND "2012-05-25" BETWEEN room_in_reservation.date_of_arrival AND room_in_reservation.date_of_departure;

--5


--6
UPDATE room_in_reservation
LEFT JOIN room r ON room_in_reservation.id_room = r.id_room
LEFT JOIN room_kind kind ON r.room_kind_id = kind.room_kind_id
LEFT JOIN hotel h ON r.hotel_id = h.hotel_id
SET room_in_reservation.date_of_departure = "2012-05-30"
WHERE h.hotel_name = "Сокол" AND kind.name = "люкс" AND room_in_reservation.date_of_arrival = '2012-05-15' AND room_in_reservation.date_of_departure = '2012-05-28'

--7
