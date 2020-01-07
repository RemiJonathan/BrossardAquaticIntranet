<?php
define('PREAMBLE', '../');
include(PREAMBLE . "assets/php/code_blocks.php");
include(PREAMBLE . "db_operations/connection.php");


echo "<!DOCTYPE HTML><html>";
block_print_document_header("Gestion de quart", PREAMBLE);
echo "<body class=\"is-preload\">";
echo "<div id=\"page-wrapper\">";
block_print_header("", PREAMBLE);
session_start();
if (isset($_SESSION['user_id'])) {
    block_print_nav("");
    if (check_user_permissions($_SESSION['user_id'], 2)) {
        $content = "<h1>Gestion de quart</h1>";
        if (isset($_GET['status_message'])) $content .= '<h3 style="color: #0F0;">' . $_GET['status_message'] . '</h3>';
        $content .= "<a href='create.php'><button>Creer un quart</button></a><br/><br/>";

        if (!isset($_GET['week'])) $_GET['week'] = date('o-\WW');

        $content .= "<form><div class=\"row gtr-uniform\"><div class=\"col-12\"><input type='week' id='week' name='week' onchange='this.form.submit()'></div></div></form>";
        //Table for Schedule
        $content .= "<div class='row'><div class='table-wrapper col-12'>";

        $content .= "<table style='empty-cells: show' class=\"alt\">
    <tbody>
        <tr>
            <th style='width: 8%'></th>
            <th id='weekDay0' style='width: 12.85%'>Dimanche</th>
            <th id='weekDay1' style='width: 12.85%'>Lundi</th>
            <th id='weekDay2' style='width: 12.85%'>Mardi</th>
            <th id='weekDay3' style='width: 12.85%'>Mercredi</th>
            <th id='weekDay4' style='width: 12.85%'>Jeudi</th>
            <th id='weekDay5' style='width: 12.85%'>Vendredi</th>
            <th id='weekDay6' style='width: 12.85%'>Samedi</th>
        </tr>";

        $convertedWeekString = $_GET['week'][0] . $_GET['week'][1] . $_GET['week'][2] . $_GET['week'][3] . $_GET['week'][5] . $_GET['week'][6] . $_GET['week'][7];
        $content .= '<tr><th></th>';
        for ($i = 0; $i < 7; $i++) {
            switch ($i) {
                case 0:
                    $firstday = date('y-m-d', strtotime($convertedWeekString . $i));
                    break;
                case 6:
                    $lastday = date('y-m-d', strtotime($convertedWeekString . $i));
                    break;
            }
            $content .= "<th><small class='small'>" . date('d/m/y', strtotime($convertedWeekString . $i)) . "</small></th>";
        }
        $content .= '</tr>';

        $this_weeks_shifts_sql = "SELECT * FROM shift WHERE start_date <= '$firstday' AND end_date >= '$lastday'";
        $this_weeks_earliest_shift_sql = $this_weeks_shifts_sql . " ORDER BY start_time";
        $this_weeks_latest_ending_shift_sql = $this_weeks_shifts_sql . " ORDER BY end_time DESC";
        $this_weeks_shifts_res = $db->query($this_weeks_shifts_sql);

        $table_begin = $db->query($this_weeks_earliest_shift_sql)->fetch_array()['start_time'];
        $table_end = $db->query($this_weeks_latest_ending_shift_sql)->fetch_array()['end_time'];


        $index = 0;
        $shift_array = array();
        while ($shift = $this_weeks_shifts_res->fetch_array(MYSQLI_ASSOC)) {
            $start_time = strtotime($shift['start_time']);
            $end_time = strtotime($shift['end_time']);

            $shift_array[$index] = $shift;

            $duration = round(abs($end_time - $start_time) / 60, 2);
            $shift_array[$index]['html'] = '<td colspan="' . ($duration / 15) . '">' . $shift['description'] . '</td>';

            $shift_array[$index]['duration'] = $duration;

            $index++;
        }

        print_r($shift_array);

        for ($i = strtotime($table_begin); $i <= strtotime($table_end); $i += (15 * 60)) {
            $content .= "<tr>";
            for ($j = 0; $j < 8; $j++) {
                switch ($j) {
                    case 0:
                        //Show the hour
                        if ($i % 1800 == 0) {
                            $content .= "<th>" . date('G:i', $i) . "</th>";
                        } else {
                            $content .= "<th><i style='color:#fff;'>15</i></th>";
                        }
                        break;
                    default:
                        $content .= "<td></td>";

                }

            }

            $content .= "</tr>";
        }


        $content .= "</tbody></table>";

        $content .= "</div></div>";


        block_print_main($content);
    } else {
        block_print_nav("<li><a href='" . PREAMBLE . "login.php'>Connexion</a></li>");

        block_print_main("<h2>D&eacute;sol&eacute;, la session est expir&eacute;e ou inexistante</h2>" . $connection_form);
        session_destroy();
    }
} else {
    block_print_nav("<li><a href='" . PREAMBLE . "login.php'>Connexion</a></li>");

    block_print_main("<h2>D&eacute;sol&eacute;, la session est expir&eacute;e ou inexistante</h2>" . $connection_form);
    session_destroy();
}
block_print_copyright();
echo "    </div>";
block_print_scripts(PREAMBLE);
echo "<script>";
if (isset($_GET['week'])) {
    echo "document.getElementById(\"week\").value = '" . $_GET['week'] . "'";
} else {
    echo "let result = getWeekNumber(new Date()); document.getElementById(\"week\").value = result[0]+'-W'+result[1];";
}
echo "</script>";
echo "	</body>";
echo "</html>";