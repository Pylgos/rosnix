{
  buildCatkinPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildCatkinPackage (finalAttrs: {
  pname = "novatel_oem7_msgs";
  version = "4.3.0-2";
  src = finalAttrs.passthru.sources."novatel_oem7_msgs";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "catkin" ]; };
  propagatedNativeBuildInputs = [ std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "message_generation" "message_runtime" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "catkin" ]; };
  propagatedBuildInputs = [ std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "message_generation" "message_runtime" ]; };
  passthru.sources = mkSourceSet (sources: {
    "novatel_oem7_msgs" = substituteSource {
      src = fetchgit {
        name = "novatel_oem7_msgs-source";
        url = "https://github.com/novatel-gbp/novatel_oem7_driver-release.git";
        rev = "b0f186bc0ea2b43ffaf956f3b2e8d3f7027fe4e3";
        hash = "sha256-7kXlWOMKULV8YFwf9sDZJ0Ic2Z27Wof+O5bQyduM2pM=";
      };
    };
  });
  meta = {
    description = "\n      Messages for NovAtel Oem7 family of receivers.\n  ";
  };
})
