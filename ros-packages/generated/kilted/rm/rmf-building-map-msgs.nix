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
  version = "1.5.0-2";
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
        rev = "29b1cd4cd8a75b41b23ce717a93d0ae7da8a46f3";
        hash = "sha256-panz5UM+k9FD/nfgBmSl6D13IlI/AjxpDJlGjI0IaZs=";
      };
    };
  });
  meta = {
    description = "Messages used to send building maps";
  };
})
