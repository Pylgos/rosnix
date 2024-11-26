{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_fleet_msgs";
  version = "3.4.1-1";
  src = finalAttrs.passthru.sources."rmf_fleet_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_fleet_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_fleet_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "2824d991b161ddc5130b6bceafecbc8588c70488";
        hash = "sha256-7Ma4wyRPaKFOlsR04xrPnhpXtRCvWY/N5lmtdzFS0WU=";
      };
    };
  });
  meta = {
    description = "A package containing messages used to interface to fleet managers";
  };
})
