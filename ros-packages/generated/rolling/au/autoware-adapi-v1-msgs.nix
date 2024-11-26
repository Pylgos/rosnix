{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  shape-msgs,
  std-msgs,
  substituteSource,
  unique-identifier-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_adapi_v1_msgs";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."autoware_adapi_v1_msgs";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geographic-msgs geometry-msgs rosidl-default-runtime shape-msgs std-msgs unique-identifier-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_adapi_v1_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_adapi_v1_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_adapi_msgs-release.git";
        rev = "d70f09816ad6d12d139b08530895fff549518325";
        hash = "sha256-5jgqVvAOI02ArN1EDxTdvc/F1f4E/LDkN9nPbnHYSQI=";
      };
    };
  });
  meta = {
    description = "The Autoware AD API interfaces";
  };
})
