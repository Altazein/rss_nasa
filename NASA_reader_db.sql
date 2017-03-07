-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 07 2017 г., 15:49
-- Версия сервера: 5.7.13
-- Версия PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `NASA_reader_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `admins`
--

INSERT INTO `admins` (`id`, `name`, `salt`, `password`, `code`) VALUES
(1, 'Admin', '4jf7cksm67c5qm59fl36crsn7gzo3967', 'bb218ebea535162c498190cde3dcfc55', 'b152504557fd075db3839e01766ef2c7');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL DEFAULT '0',
  `author_name` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `records`
--

CREATE TABLE IF NOT EXISTS `records` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `img` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `publication_date` int(11) NOT NULL,
  `upload_date` int(11) NOT NULL,
  `comments_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `records`
--

INSERT INTO `records` (`id`, `title`, `description`, `img`, `link`, `publication_date`, `upload_date`, `comments_count`) VALUES
(1, 'Oceanic Nonlinear Internal Solitary Waves From the Lombok Strait', 'On November 1, 2016, NASA’s Aqua satellite passed over Indonesia, allowing the Moderate Resolution Imaging Spectroradiometer (MODIS) on board to capture a stunning true-color image of oceanic nonlinear internal solitary waves from the Lombok Strait.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/image11052016_250m.jpg', 'http://www.nasa.gov/image-feature/oceanic-nonlinear-internal-solitary-waves-from-the-lombok-strait', 1481085420, 1488830701, 0),
(2, 'Linear Dunes, Namib Sand Sea', 'An astronaut aboard the International Space Station (ISS) used a long lens to document what crews have termed one of the most spectacular features of the planet: the dunes of the Namib Sand Sea.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/iss047e023405_lrg.jpg', 'http://www.nasa.gov/image-feature/linear-dunes-namib-sand-sea', 1481169720, 1488830701, 0),
(3, 'Sunrise With Solar Array', 'Astronaut Thomas Pesquet of the European Space Agency captured this photograph from the International Space Station on Nov. 25, 2016, and shared it on social media, writing, "Sunrises. We experience 16 sunrises every 24 hours on the International Space Station as it takes us 90 minutes to do a complete orbit of our planet flying at 28,800 km/h."', 'http://www.nasa.gov/sites/default/files/thumbnails/image/31430281685_5bf35c011d_o.jpg', 'http://www.nasa.gov/image-feature/sunrise-with-solar-array', 1481272860, 1488830701, 0),
(4, 'The Coolest Landscape on Mars (or Earth)', 'Many Martian landscapes contain features that are familiar to ones we find on Earth, like river valleys, cliffs, glaciers and volcanos.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/pia21216.jpg', 'http://www.nasa.gov/image-feature/jpl/pia21216/the-coolest-landscape-on-mars-or-earth', 1481525640, 1488830701, 0),
(5, 'HTV-6 Cargo Craft Approaches Space Station', 'Expedition 50 Commander Shane Kimbrough of NASA shared this photograph of the Japan Aerospace Exploration Agency’s Kounotori H-II Transfer Vehicle (HTV-6) as it approached the International Space Station. Kimbrough and Flight Engineer Thomas Pesquet successfully captured the spacecraft using the station''s Canadarm2 robotic arm.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/czj8bxlw8aapi4b.jpg', 'http://www.nasa.gov/image-feature/htv6-cargo-craft-approaches-space-station', 1481620320, 1488830701, 0),
(6, 'Color Variations on Mount Sharp, Mars', 'The foreground of this scene from the Mast Camera (Mastcam) on NASA''s Curiosity Mars rover shows purple-hued rocks near the rover''s late-2016 location on lower Mount Sharp. The scene''s middle distance includes higher layers that are future destinations for the mission.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/pia21256_sol1516mrseq07719-nolabels.jpg', 'http://www.nasa.gov/image-feature/color-variations-on-mount-sharp-mars', 1481703120, 1488830701, 0),
(7, 'View of NASA''s CYGNSS Hurricane Mission Launch From Chase Plane', 'Hurricane forecasters will soon have a new tool to better understand and forecast storm intensity. A constellation of eight microsatellites, called NASA’s Cyclone Global Navigation Satellite System mission, or CYGNSS, got a boost into Earth orbit aboard an Orbital ATK Pegasus XL rocket, deployed from an L-1011 aircraft.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/g0043192.jpg', 'http://www.nasa.gov/image-feature/view-of-nasas-cygnss-hurricane-mission-launch-from-chase-plane', 1481789340, 1488830701, 0),
(8, 'Hubble "Crane-s" in for a Closer Look at a Galaxy', 'Spiral galaxy IC 5201 sits 40 million light-years from us in the Crane constellation. As with most spirals we see, it has a bar of stars slicing through its center.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/potw1650a.jpg', 'http://www.nasa.gov/image-feature/goddard/2016/hubble-cranes-in-for-a-closer-look-at-a-galaxy', 1481873520, 1488830701, 0),
(9, 'Cosmic ‘Winter’ Wonderland', 'Although there are no seasons in space, this cosmic vista invokes thoughts of a frosty winter landscape. It is, in fact, a region called NGC 6357 where radiation from hot, young stars is energizing the cooler gas in the cloud that surrounds them.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/ngc6357.jpg', 'http://www.nasa.gov/mission_pages/chandra/cosmic-winter-wonderland.html', 1482130140, 1488830701, 0),
(10, 'International Space Station Solar Transit', 'This composite image, made from ten frames, shows the International Space Station, with a crew of six onboard, in silhouette as it transits the sun at roughly five miles per second, Saturday, Dec. 17, 2016, from Newbury Park, California.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/30903636564_0127bfba48_o.jpg', 'http://www.nasa.gov/image-feature/international-space-station-solar-transit', 1482215820, 1488830701, 0),
(11, 'This Week in NASA History: First Crewed Saturn V Mission Launches -- Dec. 21, 1968', 'This week in 1968, Apollo 8, the first crewed Saturn V launched from NASA''s Kennedy Space Center on Dec. 21, 1968. Here, the S-IC stage is being erected for final assembly of the Saturn V launch vehicle in Kennedy''s Vehicle Assembly Building.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/6761894-orig.jpg', 'http://www.nasa.gov/centers/marshall/history/this-week-in-nasa-history-first-crewed-saturn-v-mission-launches-dec-21-1968.html', 1482314940, 1488830701, 0),
(12, 'Pandora Up Close', 'This image from NASA''s Cassini spacecraft is one of the highest-resolution views ever taken of Saturn''s moon Pandora. Pandora (84 kilometers, or 52 miles across) orbits Saturn just outside the narrow F ring.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/pia21055-1041.jpg', 'http://www.nasa.gov/image-feature/jpl/pia21055/pandora-up-close', 1482384720, 1488830701, 0),
(13, 'Astronaut Peggy Whitson in the Festive Spirit', 'Aboard the International Space Station, Expedition 50 Flight Engineer Peggy Whitson of NASA sent holiday greetings and festive imagery from the cupola on Dec. 18.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/iss050e017211.jpg', 'http://www.nasa.gov/image-feature/astronaut-peggy-whitson-in-the-festive-spirit-0', 1482418680, 1488830701, 0),
(14, 'Lights in the Darkness', 'Just hours after the winter solstice, a mass of energetic particles from the Sun smashed into the magnetic field around Earth. The strong solar wind stream stirred up a display of northern lights over northern Canada.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/aurora_vir_2016357_lrg.jpg', 'http://www.nasa.gov/image-feature/lights-in-the-darkness', 1482825600, 1488830701, 0),
(15, 'Basking in Light', 'Sunlight truly has come to Saturn''s north pole. The whole northern region is bathed in sunlight in this view from late 2016, feeble though the light may be at Saturn''s distant domain in the solar system.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/pia20513_0.jpg', 'http://www.nasa.gov/image-feature/basking-in-light', 1482912840, 1488830701, 0),
(16, 'Hubble Gazes at a Cosmic Megamaser', 'This galaxy acts as an astronomical laser, beaming out microwave emission rather than visible light.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/potw1652a.jpg', 'http://www.nasa.gov/image-feature/goddard/2016/hubble-gazes-at-a-cosmic-megamaser', 1482996780, 1488830701, 0),
(17, 'Small Satellite Deployed From the Space Station', 'A satellite is ejected from the Japan Aerospace Exploration Agency (JAXA) Small Satellite Orbital Deployer on the International Space Station on Dec. 19, 2016. The satellite is actually two small satellites that, once at a safe distance from the station, separated from each other, but were still connected by a 100-meter-long Kevlar tether.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/iss050e017076.jpg', 'http://www.nasa.gov/image-feature/small-satellite-deployed-from-the-space-station', 1483086720, 1488830701, 0),
(18, 'Send in the Clouds', 'Floating high above the hydrocarbon lakes, wispy clouds have finally started to return to Titan''s northern latitudes.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/pia20516-1041.jpg', 'http://www.nasa.gov/image-feature/jpl/send-in-the-clouds', 1483428600, 1488830701, 0),
(19, 'Hues in a Crater Slope', 'Impact craters expose the subsurface materials on the steep slopes of Mars. However, these slopes often experience rockfalls and debris avalanches that keep the surface clean of dust, revealing a variety of hues, like in this enhanced-color image from NASA''s Mars Reconnaissance Orbiter, representing different rock types.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/pia14454.jpg', 'http://www.nasa.gov/image-feature/hues-in-a-crater-slope', 1483517880, 1488830701, 0),
(20, 'Abell 3411 and Abell 3412: Astronomers Discover Powerful Cosmic Double Whammy', 'Astronomers have discovered what happens when the eruption from a supermassive black hole is swept up by the collision and merger of two galaxy clusters.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/a3411.jpg', 'http://www.nasa.gov/mission_pages/chandra/abell-3411-and-abell-3412-astronomers-discover-powerful-cosmic-double-whammy.html', 1483601400, 1488830701, 0),
(21, 'Your Home Planet, as Seen From Mars', 'Here is a view of Earth and its moon, as seen from Mars. It combines two images acquired on Nov. 20, 2016, by the HiRISE camera on NASA''s Mars Reconnaissance Orbiter, with brightness adjusted separately for Earth and the moon to show details on both bodies.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/pia21260.jpg', 'http://www.nasa.gov/feature/jpl/earth-and-its-moon-as-seen-from-mars', 1483696800, 1488830701, 0),
(22, 'Breaking Boundaries in New Engine Designs', 'In an effort to improve fuel efficiency, NASA and the aircraft industry are rethinking aircraft design.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/bli_grc.jpg', 'http://www.nasa.gov/image-feature/breaking-boundaries-in-new-engine-designs', 1483937520, 1488830701, 0),
(23, 'Rocky Mountains From Orbit', 'Expedition 50 Flight Engineer Thomas Pesquet of the European Space Agency photographed the Rocky Mountains from his vantage point in low Earth orbit aboard the International Space Station. He shared the image with his social media followers on Jan. 9, 2017, writing, "the Rocky mountains are a step too high – even for the clouds to cross."', 'http://www.nasa.gov/sites/default/files/thumbnails/image/31946589405_deb63e02d6_o.jpg', 'http://www.nasa.gov/image-feature/rocky-mountains-from-orbit', 1484033700, 1488830701, 0),
(24, 'NASA Astronaut Peggy Whitson''s 7th Spacewalk', 'Flight Engineer Peggy Whitson along with Expedition 50 Commander Shane Kimbrough successfully installed three new adapter plates and hooked up electrical connections for three of the six new lithium-ion batteries on the International Space Station during last week''s spacewalk.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/peggyw_spacewalk.jpg', 'http://www.nasa.gov/image-feature/nasa-astronaut-peggy-whitsons-7th-spacewalk', 1484118480, 1488830701, 0),
(25, 'Well-Preserved Impact Ejecta on Mars', 'This image of a well-preserved unnamed elliptical crater in Terra Sabaea, is illustrative of the complexity of ejecta deposits forming as a by-product of the impact process that shapes much of the surface of Mars.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/pia13078.jpg', 'http://www.nasa.gov/image-feature/jpl/well-preserved-impact-ejecta-on-mars', 1484224080, 1488830701, 0),
(26, 'Crescent Jupiter with the Great Red Spot', 'This image of a crescent Jupiter and the iconic Great Red Spot was created by a citizen scientist (Roman Tkachenko) using data from Juno''s JunoCam instrument.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/pia21376d.jpg', 'http://www.nasa.gov/image-feature/jpl/crescent-jupiter-with-the-great-red-spot', 1484301600, 1488830701, 0),
(27, 'NASA Astronaut Shane Kimbrough on Jan. 13 Spacewalk', 'Expedition 50 Commander Shane Kimbrough of NASA at work outside the International Space Station on Jan. 13, 2017, in a photo taken by fellow spacewalker Thomas Pesquet of ESA. The two astronauts successfully installed three new adapter plates and hooked up electrical connections for three of the six new lithium-ion batteries on the station.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/32260740536_2866cf4065_o.jpg', 'http://www.nasa.gov/image-feature/nasa-astronaut-shane-kimbrough-on-jan-13-spacewalk', 1484641740, 1488830701, 0),
(28, 'Possible Signs of Ancient Drying in Martian Rock', 'A grid of small polygons on the Martian rock surface near the right edge of this view may have originated as cracks in drying mud more than 3 billion years ago.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/pia21263.jpg', 'http://www.nasa.gov/image-feature/jpl/pia21263/possible-signs-of-ancient-drying-in-martian-rock', 1484721000, 1488830701, 0),
(29, 'Daphnis Up Close', 'The wavemaker moon, Daphnis, is featured in this view, taken as NASA''s Cassini spacecraft made one of its ring-grazing passes over the outer edges of Saturn''s rings on Jan. 16, 2017.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/pia21056_deblurred.jpg', 'http://www.nasa.gov/image-feature/jpl/pia21056/daphnis-up-close', 1484803200, 1488830701, 0),
(30, 'New Weather Satellite Sends First Images of Earth', 'The release of the first images today from NOAA’s newest satellite, GOES-16, is the latest step in a new age of weather satellites. This composite color full-disk visible image is from 1:07 p.m. EDT on Jan. 15, 2017, and was created using several of the 16 spectral channels available on the GOES-16 Advanced Baseline Imager (ABI) instrument.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/abi_full_disk_low_res_jan_15_2017.jpg', 'http://www.nasa.gov/image-feature/new-weather-satellite-sends-first-images-of-earth', 1485158520, 1488830701, 0),
(31, 'NASA Simulates Orion Spacecraft Launch Conditions for Crew', 'In a lab at NASA’s Johnson Space Center in Houston, engineers simulated conditions that astronauts in space suits would experience when the Orion spacecraft is vibrating during launch atop the agency’s powerful Space Launch System rocket on its way to deep space destinations.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/p1010154.jpg', 'http://www.nasa.gov/image-feature/nasa-simulates-orion-spacecraft-launch-conditions-for-crew', 1485240720, 1488830701, 0),
(32, 'Juno’s Close Look at a Little Red Spot', 'The JunoCam imager on NASA’s Juno spacecraft snapped this shot of Jupiter’s northern latitudes.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/pia21378.jpg', 'http://www.nasa.gov/image-feature/jpl/pia21378/juno-s-close-look-at-a-little-red-spot', 1485347940, 1488830701, 0),
(33, 'January 1986 - Voyager 2 Flyby of Miranda', 'Uranus'' moon Miranda is shown in a computer-assembled mosaic of images obtained Jan. 24, 1986, by the Voyager 2 spacecraft. Miranda is the innermost and smallest of the five major Uranian satellites, just 480 kilometers (about 300 miles) in diameter. Nine images were combined to obtain this full-disc, south-polar view.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/9464656357_dcd9554a40_o.jpg', 'http://www.nasa.gov/image-feature/january-1986-voyager-2-flyby-of-miranda', 1485423240, 1488830701, 0),
(34, 'Apollo 1 Crew Honored', 'Astronauts, from the left, Gus Grissom, Ed White II and Roger Chaffee stand near Cape Kennedy''s Launch Complex 34 during training for Apollo 1 in January 1967.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/s67-19766.jpg', 'http://www.nasa.gov/image-feature/apollo-1-crew-honored', 1485503880, 1488830701, 0),
(35, 'Coy Dione', 'Dione''s lit hemisphere faces away from Cassini''s camera, yet the moon''s darkened surface features are dimly illuminated in this image, due to Saturnshine.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/pia20514-1041.jpg', 'http://www.nasa.gov/image-feature/jpl/pia20514/coy-dione', 1485763260, 1488830701, 0),
(36, 'NASA Day of Remembrance', 'Martha Chaffee, widow of Roger Chaffee, Sheryl Chaffee, daughter, and Roger Purvenas, son of Sheryl Chaffee, left, along with acting NASA Administrator Robert Lightfoot, right, place wreaths at the graves of Apollo 1 crewmembers Virgil "Gus" Grissom and Roger Chaffee as part of NASA''s Day of Remembrance, Tuesday, Jan. 31, 2017.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/32254810950_73f82e511f_o.jpg', 'http://www.nasa.gov/image-feature/nasa-day-of-remembrance', 1485865320, 1488830701, 0),
(37, 'Lake Powell and Grand Staircase-Escalante', 'This panorama, photographed by an astronaut aboard the International Space Station, shows nearly the full length of Lake Powell, the reservoir on the Colorado River in southern Utah and northern Arizona. Note that the ISS was north of the lake at the time, so in this view south is at the top left of the image.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/iss048e073279_lrg.jpg', 'http://www.nasa.gov/image-feature/lake-powell-and-grand-staircase-escalante', 1485935700, 1488830701, 0),
(38, 'Looking Back: Dr. George Carruthers and Apollo 16 Far Ultraviolet Camera/Spectrograph', 'Dr. George Carruthers, right, and William Conway, a project manager at the Naval Research Institute, examine the gold-plated ultraviolet camera/spectrograph, the first moon-based observatory that Carruthers developed for the Apollo 16 mission. Apollo 16 astronauts placed the observatory on the moon in April 1972.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/hrs_720125-n-zz999-001.jpg', 'http://www.nasa.gov/image-feature/looking-back-dr-george-carruthers-and-apollo-16-far-ultraviolet-cameraspectrograph', 1486020360, 1488830701, 0),
(39, 'Hubble Captures Brilliant Star Death in “Rotten Egg” Nebula', 'The Calabash Nebula, pictured here is a spectacular example of the death of a low-mass star like the sun.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/potw1705a.jpg', 'http://www.nasa.gov/image-feature/goddard/2017/hubble-captures-brilliant-star-death-in-rotten-egg-nebula', 1486104180, 1488830701, 0),
(40, 'Potentially Hospitable Enceladus', 'Seen from outside, Enceladus appears to be like most of its sibling moons: cold, icy and inhospitable.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/pia20522-1041.jpg', 'http://www.nasa.gov/image-feature/jpl/pia20522/potentially-hospitable-enceladus', 1486365960, 1488830701, 0),
(41, 'Antarctica’s Changing Larsen Ice Shelf', 'The Larsen Ice Shelf is situated along the northeastern coast of the Antarctic Peninsula, one of the fastest-warming places on the planet. In the past three decades, two large sections of the ice shelf (Larsen A and B) collapsed. A third section (Larsen C) seems like it may be on a similar trajectory, with a new iceberg poised to break away soon.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/scarinlet_oli_2016006_lrg.jpg', 'http://www.nasa.gov/image-feature/antarctica-s-changing-larsen-ice-shelf', 1486452120, 1488830701, 0),
(42, 'Sunrise at Rogers Dry Lake', 'A sunrise photo of Edwards Air Force Base’s Rogers Dry Lake was taken after heavy rainfall in southern California. NASA’s Armstrong Flight Research Center is seen in the foreground.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/afrc2017-0022-01.jpg', 'http://www.nasa.gov/image-feature/sunrise-at-rogers-dry-lake', 1486546800, 1488830701, 0),
(43, 'Jeanette A. Scissum, Scientist and Mathematician at NASA Marshall', 'Jeanette Scissum joined NASA’s Marshall Space Flight Center in 1964 after earning bachelor''s and master''s degrees in mathematics from Alabama A&M University. Scissum published a NASA report in 1967, “Survey of Solar Cycle Prediction Models,” which put forward techniques for improved forecasting of the sunspot cycle.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/415205_2.jpg', 'http://www.nasa.gov/centers/marshall/history/jeanette-a-scissum.html', 1486618020, 1488830701, 0),
(44, 'Hubble Sees Spiral in Andromeda', 'The Andromeda constellation is one of the 88 modern constellations and should not be confused with our neighboring Andromeda Galaxy.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/potw1706a.jpg', 'http://www.nasa.gov/image-feature/goddard/2017/hubble-sees-spiral-in-andromeda', 1486711200, 1488830701, 0),
(45, 'F for Fabulous', 'When seen up close, the F ring of Saturn resolves into multiple dusty strands. This Cassini view shows three bright strands and a very faint fourth strand off to the right.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/pia20519.jpg', 'http://www.nasa.gov/image-feature/jpl/PIA20519/f-for-fabulous', 1486972800, 1488830701, 0),
(46, 'Space Station Flight Over Venice', 'Expedition 50 Flight Engineer Thomas Pesquet of the European Space Agency shared this photograph from the International Space Station on Feb. 14, 2017, writing, "Venice, city of gondoliers and the lovers they carry along the canals. Happy Valentine''s Day!"', 'http://www.nasa.gov/sites/default/files/thumbnails/image/31959972485_7e13114ac9_o.jpg', 'http://www.nasa.gov/image-feature/space-station-flight-over-venice', 1487058300, 1488830701, 0),
(47, 'Glacial ''Aftershock'' Spawns Antarctic Iceberg', 'Pine Island Glacier has shed another block of ice into Antarctic waters. The loss was tiny compared to the icebergs that broke off in 2014 and 2015, but the event is further evidence of the ice shelf’s fragility.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/pineisland_oli_2017026_lrg-crop.jpg', 'http://www.nasa.gov/image-feature/glacial-aftershock-spawns-antarctic-iceberg', 1487145120, 1488830701, 0),
(48, 'Thomas Byrdsong, Aerospace Engineer at NASA Langley Research Center', 'On March 2, 1963 Engineer Thomas Byrdsong checks the Apollo/Saturn 1B Ground-wind-loads model in the Transonic Dynamics Tunnel at Langley Research Center in Hampton, Virginia.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/thomasbyrdsong.jpg', 'http://www.nasa.gov/image-feature/thomas-byrdsong-aerospace-engineer-at-nasa-langley-research-center', 1487229060, 1488830701, 0),
(49, 'Falcon 9 Rocket With Dragon Spacecraft Vertical at Launch Complex 39A', 'NASA provider SpaceX''s Falcon 9 rocket and Dragon spacecraft are vertical at Launch Complex 39A at NASA’s Kennedy Space Center in Florida. Liftoff of SpaceX''s tenth Commercial Resupply Services cargo mission to the International Space Station is scheduled for 10:01 a.m. EST on Saturday, Feb. 18, 2017.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/32945170225_58129f00dc_o.jpg', 'http://www.nasa.gov/image-feature/falcon-9-rocket-with-dragon-spacecraft-vertical-at-launch-complex-39a', 1487317080, 1488830701, 0),
(50, 'Liftoff of SpaceX Falcon 9 and Dragon From Launch Complex 39A', 'A SpaceX Falcon 9 rocket lifts off from Launch Complex 39A at NASA''s Kennedy Space Center in Florida. This is the company''s 10th commercial resupply services mission to the International Space Station. Liftoff was at 9:39 a.m. EST from the historic launch site now operated by SpaceX under a property agreement with NASA.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/32993070285_ab8a4b50bd_o.jpg', 'http://www.nasa.gov/image-feature/liftoff-of-spacex-falcon-9-and-dragon-from-launch-complex-39a', 1487504100, 1488830701, 0),
(51, 'Rays of Creusa', 'When viewed from a distance with the sun directly behind Cassini, the larger, brighter craters really stand out on moons like Dione.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/pia20521-1041.jpg', 'http://www.nasa.gov/image-feature/jpl/pia20521/rays-of-creusa', 1487662200, 1488830701, 0),
(52, 'Sounding Rocket Launches to Study Auroras', 'A NASA Black Brant IX sounding rocket soars skyward into an aurora over Alaska following a 5:14 a.m. EST, Feb. 22, 2017 launch from the Poker Flat Research Range in Alaska. The rocket carried an Ionospheric Structuring: In Situ and Groundbased Low Altitude StudieS (ISINGLASS) instrumented payload examining the structure of an aurora.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/zap10018.jpg', 'http://www.nasa.gov/image-feature/sounding-rocket-launches-to-study-auroras', 1487749140, 1488830701, 0),
(53, 'Charles T. Smoot', 'Charles Smoot was employed by NASA’s Marshall Space Flight Center where he began laying the foundation of a cooperative program targeting qualified African American students from universities across the nation.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/smoot_photo.jpg', 'http://www.nasa.gov/centers/marshall/history/charles-t-smoot.html', 1487829840, 1488830701, 0),
(54, 'Orion Spacecraft Progress Continues With Installation of Module to Test Propulsion Systems', 'On Feb. 22, engineers successfully installed ESA’s European Service Module Propulsion Qualification Module (PQM) at NASA’s White Sands Test Facility in New Mexico that was delivered by Airbus – ESA’s prime contractor for the Service Module. The module will be equipped with a total of 21 engines to support NASA’s Orion spacecraft.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/p1010141.jpg', 'http://www.nasa.gov/image-feature/orion-spacecraft-progress-continues-with-installation-of-module-to-test-propulsion', 1487923860, 1488830701, 0),
(55, 'Images of the Sun From the GOES-16 Satellite', 'These images of the sun were captured at the same time on January 29, 2017 by the six channels on the Solar Ultraviolet Imager or SUVI instrument aboard NOAA’s GOES-16 satellite. Data from SUVI will provide an estimation of coronal plasma temperatures and emission measurements which are important to space weather forecasting.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/suvi_horz2.png', 'http://www.nasa.gov/image-feature/images-of-the-sun-from-the-goes-16-satellite', 1488183300, 1488830701, 0),
(56, 'Glaciers Ebb on South Georgia Island', 'Frequent cloud cover in the southern Atlantic Ocean often obscures satellite images of South Georgia and the South Sandwich Islands. But occasionally the clouds give way. On September 14, 2016, the Operational Land Imager (OLI) on Landsat 8 captured natural-color images of South Georgia Island, where several glaciers are in retreat.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/neumayer_oli_2016258_lrg.jpg', 'http://www.nasa.gov/image-feature/glaciers-ebb-on-south-georgia-island', 1488267840, 1488830701, 0),
(57, 'Pearl Young at Langley''s Flight Instrumentation Facility, March 1929', 'In this March 29, 1929 photograph, Pearl I. Young is working in the Langley Memorial Aeronautical Laboratory''s Flight Instrumentation Facility (Building 1202). Young was the first woman hired as a technical employee, a physicist at the National Advisory Committee for Aeronautics and the second female physicist working for the federal government.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/l-03247.jpg', 'http://www.nasa.gov/image-feature/pearl-young-at-langleys-flight-instrumentation-facility-march-1929', 1488370920, 1488830701, 0),
(58, 'Hubble Showcases a Remarkable Galactic Hybrid', 'UGC 12591''s classification straddles somewhere between a lenticular and a spiral galaxy. It lies just under 400 million light-years from us in the Pisces–Perseus Supercluster.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/potw1709a.jpg', 'http://www.nasa.gov/image-feature/goddard/2017/hubble-showcases-a-remarkable-galactic-hybrid', 1488524640, 1488830701, 0),
(59, 'Technicians Secure the Protective Covering Around CYGNUS', 'In the Space Station Processing Facility high bay at NASA''s Kennedy Space Center in Florida, the Orbital ATK CYGNUS pressurized cargo module is secured the KAMAG transporter and the crane has been removed.', 'http://www.nasa.gov/sites/default/files/thumbnails/image/33133284096_7e0bb60323_o_0.jpg', 'http://www.nasa.gov/image-feature/technicians-secure-the-protective-covering-around-cygnus', 1488789480, 1488830701, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `code` varchar(32) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `salt`, `password`, `code`) VALUES
(5, 'UserOne', 'RUpTaWtcTEotI6qQDZy7CpYizdlporD8', 'd585015aab2dcead575221dbb20ef08b', '2e53ed0c69891f8ca1925a30c978f528'),
(6, 'User2', 'L7OXSy3x36L8sITBnIK2O9AKVeAvjdP7', 'ea159e9a0eac9851140cb9178f581928', '58056c4637cc1ff09d1aec844e261129'),
(7, 'User3', 'iYltnlX92dVRzQtl7NGNnHWP2LZD8sTQ', '404303117378f4e3017188e8c6257c1a', 'bd371622f7d35625c28eee59bb4acd55'),
(8, 'User12345', 'SrLpzXv8Ymo10q5rUcZrLxSFqluHDeHn', '6c42ef386f4b2dd7e6886f9bf62ac8c7', 'de005203bbac5504ef6477ae2423a9ca'),
(9, 'User123456', 'y4X1Lg9FkwT3ZbmuPaZ9ZEOn6gukiMjY', 'bdb6e611cef98d24ba8581d0f4747bde', '4a7ae1f31e66eca355cd91115358bbde'),
(10, 'qwerqwer', 'QFIAHetpliMlq71LvoFxWVm0nHXNWyQQ', 'f4197ab4b18fdbe35816017e5f009f6f', 'a329c07d98f354fb210eba2397cfbce2');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pecord_publication_date` (`publication_date`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `records`
--
ALTER TABLE `records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
