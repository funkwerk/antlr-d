// Generated from doc/examples/TimeTable.g4 by ANTLR 4.7.1
import antlr.v4.runtime.tree.ParseTreeListener;
import TimeTableParser : TimeTableParser;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link TimeTableParser}.
 */
public interface TimeTableListener : ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#linie}.
	 * @param ctx the parse tree
	 */
	void enterLinie(TimeTableParser.LinieContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#linie}.
	 * @param ctx the parse tree
	 */
	void exitLinie(TimeTableParser.LinieContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#gueltig_vom}.
	 * @param ctx the parse tree
	 */
	void enterGueltig_vom(TimeTableParser.Gueltig_vomContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#gueltig_vom}.
	 * @param ctx the parse tree
	 */
	void exitGueltig_vom(TimeTableParser.Gueltig_vomContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#gueltig_bis}.
	 * @param ctx the parse tree
	 */
	void enterGueltig_bis(TimeTableParser.Gueltig_bisContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#gueltig_bis}.
	 * @param ctx the parse tree
	 */
	void exitGueltig_bis(TimeTableParser.Gueltig_bisContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#liniendefinition}.
	 * @param ctx the parse tree
	 */
	void enterLiniendefinition(TimeTableParser.LiniendefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#liniendefinition}.
	 * @param ctx the parse tree
	 */
	void exitLiniendefinition(TimeTableParser.LiniendefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#fahrten}.
	 * @param ctx the parse tree
	 */
	void enterFahrten(TimeTableParser.FahrtenContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#fahrten}.
	 * @param ctx the parse tree
	 */
	void exitFahrten(TimeTableParser.FahrtenContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#linien_teil}.
	 * @param ctx the parse tree
	 */
	void enterLinien_teil(TimeTableParser.Linien_teilContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#linien_teil}.
	 * @param ctx the parse tree
	 */
	void exitLinien_teil(TimeTableParser.Linien_teilContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#fahrt}.
	 * @param ctx the parse tree
	 */
	void enterFahrt(TimeTableParser.FahrtContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#fahrt}.
	 * @param ctx the parse tree
	 */
	void exitFahrt(TimeTableParser.FahrtContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#station}.
	 * @param ctx the parse tree
	 */
	void enterStation(TimeTableParser.StationContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#station}.
	 * @param ctx the parse tree
	 */
	void exitStation(TimeTableParser.StationContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#station_id}.
	 * @param ctx the parse tree
	 */
	void enterStation_id(TimeTableParser.Station_idContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#station_id}.
	 * @param ctx the parse tree
	 */
	void exitStation_id(TimeTableParser.Station_idContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#text}.
	 * @param ctx the parse tree
	 */
	void enterText(TimeTableParser.TextContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#text}.
	 * @param ctx the parse tree
	 */
	void exitText(TimeTableParser.TextContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#start}.
	 * @param ctx the parse tree
	 */
	void enterStart(TimeTableParser.StartContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#start}.
	 * @param ctx the parse tree
	 */
	void exitStart(TimeTableParser.StartContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#ziel}.
	 * @param ctx the parse tree
	 */
	void enterZiel(TimeTableParser.ZielContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#ziel}.
	 * @param ctx the parse tree
	 */
	void exitZiel(TimeTableParser.ZielContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#via}.
	 * @param ctx the parse tree
	 */
	void enterVia(TimeTableParser.ViaContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#via}.
	 * @param ctx the parse tree
	 */
	void exitVia(TimeTableParser.ViaContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#vias}.
	 * @param ctx the parse tree
	 */
	void enterVias(TimeTableParser.ViasContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#vias}.
	 * @param ctx the parse tree
	 */
	void exitVias(TimeTableParser.ViasContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#default_zuglaenge}.
	 * @param ctx the parse tree
	 */
	void enterDefault_zuglaenge(TimeTableParser.Default_zuglaengeContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#default_zuglaenge}.
	 * @param ctx the parse tree
	 */
	void exitDefault_zuglaenge(TimeTableParser.Default_zuglaengeContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#default_gleis}.
	 * @param ctx the parse tree
	 */
	void enterDefault_gleis(TimeTableParser.Default_gleisContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#default_gleis}.
	 * @param ctx the parse tree
	 */
	void exitDefault_gleis(TimeTableParser.Default_gleisContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#verkehrstag_legende}.
	 * @param ctx the parse tree
	 */
	void enterVerkehrstag_legende(TimeTableParser.Verkehrstag_legendeContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#verkehrstag_legende}.
	 * @param ctx the parse tree
	 */
	void exitVerkehrstag_legende(TimeTableParser.Verkehrstag_legendeContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#condition}.
	 * @param ctx the parse tree
	 */
	void enterCondition(TimeTableParser.ConditionContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#condition}.
	 * @param ctx the parse tree
	 */
	void exitCondition(TimeTableParser.ConditionContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#datum}.
	 * @param ctx the parse tree
	 */
	void enterDatum(TimeTableParser.DatumContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#datum}.
	 * @param ctx the parse tree
	 */
	void exitDatum(TimeTableParser.DatumContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#day}.
	 * @param ctx the parse tree
	 */
	void enterDay(TimeTableParser.DayContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#day}.
	 * @param ctx the parse tree
	 */
	void exitDay(TimeTableParser.DayContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#wochenfeiertag}.
	 * @param ctx the parse tree
	 */
	void enterWochenfeiertag(TimeTableParser.WochenfeiertagContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#wochenfeiertag}.
	 * @param ctx the parse tree
	 */
	void exitWochenfeiertag(TimeTableParser.WochenfeiertagContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#date}.
	 * @param ctx the parse tree
	 */
	void enterDate(TimeTableParser.DateContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#date}.
	 * @param ctx the parse tree
	 */
	void exitDate(TimeTableParser.DateContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#cond_date}.
	 * @param ctx the parse tree
	 */
	void enterCond_date(TimeTableParser.Cond_dateContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#cond_date}.
	 * @param ctx the parse tree
	 */
	void exitCond_date(TimeTableParser.Cond_dateContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#range_of_days}.
	 * @param ctx the parse tree
	 */
	void enterRange_of_days(TimeTableParser.Range_of_daysContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#range_of_days}.
	 * @param ctx the parse tree
	 */
	void exitRange_of_days(TimeTableParser.Range_of_daysContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#days}.
	 * @param ctx the parse tree
	 */
	void enterDays(TimeTableParser.DaysContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#days}.
	 * @param ctx the parse tree
	 */
	void exitDays(TimeTableParser.DaysContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#date_expression}.
	 * @param ctx the parse tree
	 */
	void enterDate_expression(TimeTableParser.Date_expressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#date_expression}.
	 * @param ctx the parse tree
	 */
	void exitDate_expression(TimeTableParser.Date_expressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#date_key_legend}.
	 * @param ctx the parse tree
	 */
	void enterDate_key_legend(TimeTableParser.Date_key_legendContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#date_key_legend}.
	 * @param ctx the parse tree
	 */
	void exitDate_key_legend(TimeTableParser.Date_key_legendContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#date_key}.
	 * @param ctx the parse tree
	 */
	void enterDate_key(TimeTableParser.Date_keyContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#date_key}.
	 * @param ctx the parse tree
	 */
	void exitDate_key(TimeTableParser.Date_keyContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#gleis}.
	 * @param ctx the parse tree
	 */
	void enterGleis(TimeTableParser.GleisContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#gleis}.
	 * @param ctx the parse tree
	 */
	void exitGleis(TimeTableParser.GleisContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#zuglaenge}.
	 * @param ctx the parse tree
	 */
	void enterZuglaenge(TimeTableParser.ZuglaengeContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#zuglaenge}.
	 * @param ctx the parse tree
	 */
	void exitZuglaenge(TimeTableParser.ZuglaengeContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#verkehrstagesschluessel}.
	 * @param ctx the parse tree
	 */
	void enterVerkehrstagesschluessel(TimeTableParser.VerkehrstagesschluesselContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#verkehrstagesschluessel}.
	 * @param ctx the parse tree
	 */
	void exitVerkehrstagesschluessel(TimeTableParser.VerkehrstagesschluesselContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#ankunftszeit}.
	 * @param ctx the parse tree
	 */
	void enterAnkunftszeit(TimeTableParser.AnkunftszeitContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#ankunftszeit}.
	 * @param ctx the parse tree
	 */
	void exitAnkunftszeit(TimeTableParser.AnkunftszeitContext ctx);
	/**
	 * Enter a parse tree produced by {@link TimeTableParser#abfahrtszeit}.
	 * @param ctx the parse tree
	 */
	void enterAbfahrtszeit(TimeTableParser.AbfahrtszeitContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeTableParser#abfahrtszeit}.
	 * @param ctx the parse tree
	 */
	void exitAbfahrtszeit(TimeTableParser.AbfahrtszeitContext ctx);
}