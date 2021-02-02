unit module Android::Versions;
my %data = "BASE" => { "api" => 1, "ndk" => 0, "semver" => "1.0", "name" => "(no code name)" }, "BASE_1_1" => {
    "api" => 2, "ndk" => 0, "semver" => "1.1", "name" => "(no code name)" }, "CUPCAKE" => { "api" => 3, "ndk" => 1,
                                                                                            "semver" => "1.5", "name" =>
                                                                                            "Cupcake" }, "DONUT" => {
    "api" => 4, "ndk" => 2, "semver" => "1.6", "name" => "Donut" }, "ECLAIR" => { "api" => 5, "ndk" => 2, "semver" =>
        "2.0", "name" => "Eclair" }, "ECLAIR_0_1" => { "api" => 6, "ndk" => 2, "semver" => "2.0.1", "name" =>
        "Eclair" },
           "ECLAIR_MR1" => { "api" => 7, "ndk" => 3, "semver" => "2.1", "name" => "Eclair" }, "FROYO" => { "api" => 8,
                                                                                                           "ndk" => 4,
                                                                                                           "semver" =>
                                                                                                           "2.2.x",
                                                                                                           "name" =>
                                                                                                           "Froyo" },
           "GINGERBREAD" => { "api" => 9, "ndk" => 5, "semver" => "2.3.0 - 2.3.2", "name" => "Gingerbread" },
           "GINGERBREAD_MR1" => { "api" => 10, "ndk" => 5, "semver" => "2.3.3 - 2.3.7", "name" => "Gingerbread" },
           "HONEYCOMB" => { "api" => 11, "ndk" => 5, "semver" => "3.0", "name" => "Honeycomb" }, "HONEYCOMB_MR1" => {
            "api" => 12, "ndk" => 6, "semver" => "3.1", "name" => "Honeycomb" }, "HONEYCOMB_MR2" => { "api" => 13,
                                                                                                      "ndk" => 6,
                                                                                                      "semver" =>
                                                                                                      "3.2.x",
                                                                                                      "name" =>
                                                                                                      "Honeycomb" },
           "ICE_CREAM_SANDWICH" => { "api" => 14, "ndk" => 7, "semver" => "4.0.1 - 4.0.2", "name" =>
                   "Ice Cream Sandwich" }, "ICE_CREAM_SANDWICH_MR1" => { "api" => 15, "ndk" => 8, "semver" =>
                "4.0.3 - 4.0.4",
                                                                         "name" => "Ice Cream Sandwich" },
           "JELLY_BEAN" => {
               "api" => 16, "ndk" => 8, "semver" => "4.1.x", "name" => "Jellybean" }, "JELLY_BEAN_MR1" => { "api" =>
                                                                                                                    17,
                                                                                                            "ndk" =>
                                                                                                            8,
                                                                                                            "semver" =>
                                                                                                            "4.2.x",
                                                                                                            "name" =>
                                                                                                            "Jellybean" },
           "JELLY_BEAN_MR2" => { "api" => 18, "ndk" => 8, "semver" => "4.3.x",
                                 "name" => "Jellybean" }, "KITKAT" => { "api" =>
                                                                                19,
                                                                        "ndk" =>
                                                                        8,
                                                                        "semver" =>
                                                                        "4.4.0 - 4.4.4",
                                                                        "name" =>
                                                                        "KitKat" },
           "KITKAT_WATCH" => { "api" => 20, "ndk" => 8, "semver" => "4.4", "name" => "KitKat Watch" }, "LOLLIPOP" => {
            "api" => 21, "ndk" => 8, "semver" => "5.0", "name" => "Lollipop" }, "LOLLIPOP_MR1" => { "api" => 22,
                                                                                                    "ndk" => 8,
                                                                                                    "semver" => "5.1",
                                                                                                    "name" =>
                                                                                                    "Lollipop" }, "M" =>
           {
               "api" => 23, "ndk" => 8, "semver" => "6.0", "name" => "Marshmallow" }, "N" => { "api" => 24, "ndk" =>
                8, "semver" =>
                                                                                               "7.0",
                                                                                               "name" => "Nougat" },
           "N_MR1" => { "api" => 25, "ndk" => 8, "semver" => "7.1", "name" => "Nougat" }, "O" => {
            "api" => 26, "ndk" => 8, "semver" => "8.0.0", "name" => "Oreo" }, "O_MR1" => { "api" => 27, "ndk" => 8,
                                                                                           "semver" =>
                                                                                           "8.1.0", "name" =>
                                                                                           "Oreo" }, "P" => { "api" =>
                                                                                                                      28,
                                                                                                              "ndk" =>
                                                                                                              8,
                                                                                                              "semver" =>
                                                                                                              "9",
                                                                                                              "name" =>
                                                                                                              "Pie" },
           "Q" => { "api" => 29,
                    "ndk" => 8,
                    "semver" =>
                    "10",
                    "name" =>
                    "Android10" },
           "R" => { "api" => 30, "ndk" => 8, "semver" => "11", "name" => "Android11" };

sub parse-semver(Str $semver) {
    my @parts;
    if $semver.contains('-') {
        @parts = $semver.split('-')>>.trim;
    }
    elsif $semver.contains('x') {
        my $norm = $semver.trans('x' => '');
        @parts = [ $norm ~ '0', $norm ~ '9'];
    }
    elsif $semver.match(/\d+\.\d+/) {
        @parts = [$semver ~ '.0',$semver ~ '.0'];
    }
    else {
        @parts = [$semver,$semver];
    }
    my $range = Range.new(@parts[0],@parts[1]);
    return $range;
}

my package EXPORT::DEFAULT {
    for <api ndk semver name> -> $name {
        OUR::{'&' ~ 'by-' ~ $name} := sub (Any $key is copy) {
            if $name eq "semver" {
                $key ~= '.0' if $key ~~ /^\d+\.\d+$/;
                return %data.values.grep(sub ($a) { $key (elem) parse-semver($a<semver>)})
            }else {
                return %data.values.grep(*{$name} == $key)
            }
        };
    }
    for %data.keys -> $codename {
        OUR::{"Android_" ~ $codename} := %data{$codename};
    }
    OUR::{'&by-codename'} := sub (Str $name) {
        return %data{$name};
    }
    OUR::{'ANDROID_VERSIONS'} := %data;
}