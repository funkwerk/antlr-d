module de.Connection;

import std.array;
import std.conv;
import std.datetime;
import rule.Repository;
import rule.GeneratedRule;
import de.Phrases;

class Connection : Phrases
{
    override string[] rule(AnnouncementProperties[] parts, AnnouncementProperties link, AnnouncementProperties additional, AnnouncementProperties substitution, AnnouncementProperties regularTrain, AnnouncementProperties[] connections, AnnouncementProperties[] laterConnections, AnnouncementProperties[] alternativeJourneys)
    {
        output.clear;

        with(parts[0])
        {
            if ( ! station.empty)
            {
                stationName(station);
                append("-");
            }
            append("Bahnsteig");
            append(track);
            append("!");
            foreach (int connections_index, connection; connections)
            {
                if (connections_index == 0)
                {
                    if (connections_index == connections.length-1)
                    {
                        append("Die nächste Reisemöglichkeit ist:");
                    }
                    else
                    {
                        append("Die nächsten Reisemöglichkeiten sind:");
                    }
                }
                productName(connection.product);
                append("nach");
                stationName(connection.destination);
                append(", Planabfahrt");
                timeOfDay(connection.departureTime);
                if (connection.track == "BUS" || connection.isCancelled)
                {
                    append(". Dieser Zug wird als Schienenersatzverkehr geführt");
                }
                else
                {
                    append(", Bahnsteig");
                    append(connection.track);
                }
                if (connections_index == connections.length-1)
                {
                    append(".");
                }
                else
                {
                    append(",");
                }
                if ( ! connection.journeyBreaks.empty)
                {
                    if (station != connection.journeyBreaks[0].firstServicedStop)
                    {
                        if ( ! connection.busReplacement.empty && connection.busReplacement[0] == connection.journeyBreaks[0].lastServicedStop)
                        {
                            append("Dieser Zug wird zwischen");
                            stationName(connection.journeyBreaks[0].lastServicedStop);
                            append("und");
                            stationName(connection.journeyBreaks[0].firstServicedStop);
                            append("als Schienenersatzverkehr geführt");
                        }
                        else
                        {
                            append("Dieser Zug fällt zwischen");
                            stationName(connection.journeyBreaks[0].lastServicedStop);
                            append("und");
                            stationName(connection.journeyBreaks[0].firstServicedStop);
                            append("aus");
                            if ( ! connection.reason.empty)
                            {
                                append(". Grund dafür");
                                reasonText(connection.reason);
                            }
                        }
                        if (connections_index == connections.length-1)
                        {
                            append(".");
                        }
                        else
                        {
                            append(",");
                        }
                    }
                }
            }
        }
        
        return output.data;
    }

    static this()
    {
        Connection inst = new Connection();
        inst.type = "CONNECTION";
        inst.language = "de";
        Repository.register(inst);
    }
}
