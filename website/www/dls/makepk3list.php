<?php
$mapDirectory = '/home/trep/server/base'; // Replace with the actual path to your map directory

if (is_dir($mapDirectory)) {
    if ($dirHandle = opendir($mapDirectory)) {
        $maps = array();
        while (($file = readdir($dirHandle)) !== false) {
            $filePath = $mapDirectory . '/' . $file;
            if (is_file($filePath) && pathinfo($filePath, PATHINFO_EXTENSION) === 'pk3') {
                $maps[] = $file;
            }
        }
        closedir($dirHandle);
    } else {
        echo "Failed to open the directory.";
    }
} else {
    echo "The provided map directory is not valid.";
}

// Generate HTML page
echo '<html><head><title>Quake 3 Maps</title></head><body>';

foreach ($maps as $map) {
    $mapName = pathinfo($map, PATHINFO_FILENAME);
    $screenshotPath = $mapDirectory . '/' . $mapName . '.jpg'; // Assuming the screenshot file has the same name as the map file with a .jpg extension

    if (file_exists($screenshotPath)) {
        echo '<h2>' . $mapName . '</h2>';
        echo '<img src="' . $screenshotPath . '" alt="' . $mapName . '">';
    } else {
        echo '<h2>' . $mapName . '</h2>';
        echo '<p>No screenshot available for this map.</p>';
    }
}

echo '</body></html>';


