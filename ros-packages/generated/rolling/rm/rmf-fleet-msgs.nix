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
  version = "3.5.0-1";
  src = finalAttrs.passthru.sources."rmf_fleet_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_fleet_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_fleet_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "4235d4eaa2b18051137bac205f5cc447b48ff38e";
        hash = "sha256-2XoC/lepw/Gx3+q3nEuM7ni/qsceSicYCOaZqiTw5Rs=";
      };
    };
  });
  meta = {
    description = "A package containing messages used to interface to fleet managers";
  };
})
