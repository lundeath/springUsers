package com.global.utils;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

import static org.junit.Assert.*;
@RunWith(PowerMockRunner.class)
@PrepareForTest({Scrambler.class })
public class ScramblerTest {

    private static final String DECODED_STRING = "Smith";
    private static final String ENCODED_STRING = "U21pdGg=";


    @Test
    public void base64encode() {
        PowerMockito.mockStatic(Scrambler.class);
        PowerMockito.when(Scrambler.base64encode(DECODED_STRING))
                .thenReturn(ENCODED_STRING);
    }

    @Test
    public void base64decode() {
        PowerMockito.mockStatic(Scrambler.class);
        PowerMockito.when(Scrambler.base64decode(ENCODED_STRING))
                .thenReturn(DECODED_STRING);
    }
}