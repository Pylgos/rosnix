{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "autoware_map_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_map_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "0a0e2d0f021a5a0164ce01826a45f16e24fb4ae8";
        hash = "sha256-cbBDQpjHlFe/5bEviTqm1EE9Tbsz+eKSkfHqLgsXZ4c=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_map_msgs";
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."autoware_map_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Autoware map messages package.";
  };
})
