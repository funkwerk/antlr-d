module antlr.v4.runtime.atn.InterfaceATNSimulator;

import antlr.v4.runtime.atn.PredictionContext;

interface InterfaceATNSimulator {
    public PredictionContext getCachedContext(PredictionContext);
}
