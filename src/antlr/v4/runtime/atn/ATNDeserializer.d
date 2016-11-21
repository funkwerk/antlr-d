/*
 * [The "BSD license"]
 *  Copyright (c) 2013 Terence Parr
 *  Copyright (c) 2013 Sam Harwell
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *  1. Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *  2. Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *  3. The name of the author may not be used to endorse or promote products
 *     derived from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 *  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 *  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 *  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 *  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

module antlr.v4.runtime.atn.ATNDeserializer;

import std.uuid;

// Class ATNDeserializer
/**
 * TODO add class description
 */
class ATNDeserializer
{

    public static immutable int SERIALIZED_VERSION = 3;

    public static UUID BASE_SERIALIZED_UUID;

    public static UUID ADDED_PRECEDENCE_TRANSITIONS;

    public static UUID ADDED_LEXER_ACTIONS;

    public static UUID[] SUPPORTED_UUIDS;

    /**
     * @uml
     * This is the current serialized UUID.
     */
    public static UUID SERIALIZED_UUID;

    public static this()
    {
        /* WARNING: DO NOT MERGE THESE LINES. If UUIDs differ during a merge,
         * resolve the conflict by generating a new ID!
         */
        BASE_SERIALIZED_UUID = sha1UUID("33761B2D-78BB-4A43-8B0B-4F5BEE8AACF3");
        ADDED_PRECEDENCE_TRANSITIONS = sha1UUID("1DA0C57D-6C06-438A-9B27-10BCB3CE0F61");
        ADDED_LEXER_ACTIONS = sha1UUID("AADB8D7E-AEEF-4415-AD2B-8204D6CF042E");
        SUPPORTED_UUIDS ~= BASE_SERIALIZED_UUID;
        SUPPORTED_UUIDS ~= ADDED_PRECEDENCE_TRANSITIONS;
        SUPPORTED_UUIDS ~= ADDED_LEXER_ACTIONS;

        SERIALIZED_UUID = ADDED_LEXER_ACTIONS;
    }

}
