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
  version = "24.1.0-1";
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
        rev = "10fe093769b1fdf4b99b3d8248995ea101031bd7";
        hash = "sha256-PoDFa2rQO/zS+QHZVWgqt9ON/pLgF+Ta9z2vH5qz8yI=";
      };
    };
  });
  meta = {
    description = "\n      Messages for NovAtel Oem7 family of receivers.\n  ";
  };
})
