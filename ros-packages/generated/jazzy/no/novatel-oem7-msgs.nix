{
  ament-cmake,
  buildColconPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildColconPackage (finalAttrs: {
  pname = "novatel_oem7_msgs";
  version = "24.2.1-1";
  src = finalAttrs.passthru.sources."novatel_oem7_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "novatel_oem7_msgs" = substituteSource {
      src = fetchgit {
        name = "novatel_oem7_msgs-source";
        url = "https://github.com/novatel-gbp/novatel_oem7_driver-release.git";
        rev = "1529731f875b83bebb32d610118d136e2fb9c57e";
        hash = "sha256-TBlWCzdS/FTsWtj6s5K6xzdEX4Sh408yo0Qd7lbRZm0=";
      };
    };
  });
  meta = {
    description = "\n      Messages for NovAtel Oem7 family of receivers.\n  ";
  };
})
