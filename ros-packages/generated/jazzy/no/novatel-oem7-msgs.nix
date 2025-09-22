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
  version = "24.2.0-1";
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
        rev = "4cd471b38d904bffd07094ff75d9d158138d3f90";
        hash = "sha256-1QH0L0et60JRF0ogsFMkAHTzNZwYYAzI1cqiLuO8aQI=";
      };
    };
  });
  meta = {
    description = "\n      Messages for NovAtel Oem7 family of receivers.\n  ";
  };
})
