{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_building_map_msgs";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."rmf_building_map_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_building_map_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_building_map_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_building_map_msgs-release.git";
        rev = "cd2a08a4ba530b41cd9f6b1ff2864ec2a02822d6";
        hash = "sha256-C77ct0ayA1iMUC5gSOnns2Wu7+0zSOFJQcUeQDWL9oE=";
      };
    };
  });
  meta = {
    description = "Messages used to send building maps";
  };
})
