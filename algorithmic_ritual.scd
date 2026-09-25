(
s.waitForBoot({

    SynthDef(\tone, { |freq = 220, amp = 0.1, dur = 0.3|
        var env;
        var sound;

        env = Env.perc(0.01, dur).kr(doneAction: 2);
        sound = SinOsc.ar(freq) * env * amp;

        Out.ar(0, sound ! 2);
    }).add;

    s.sync;

    Routine({
        var notes;

        notes = [220, 247, 277, 330, 370, 440];

        40.do {
            var freq;
            var amp;
            var dur;
            var waitTime;

            freq = notes.choose;
            amp = rrand(0.08, 0.18);
            dur = rrand(0.15, 0.4);
            waitTime = rrand(0.2, 0.6);

            Synth(\tone, [
                \freq, freq,
                \amp, amp,
                \dur, dur
            ]);

            waitTime.wait;
        };

    }).play;

});
)
