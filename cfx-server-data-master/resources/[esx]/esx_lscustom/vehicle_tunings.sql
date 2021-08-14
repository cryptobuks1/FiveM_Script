USE DATABASE ``;
CREATE TABLE `vehicle_tunings` (
  `id` int(11) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `mods` text NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
ALTER TABLE `vehicle_tunings`
  ADD PRIMARY KEY (`id`);
  
ALTER TABLE `vehicle_tunings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;