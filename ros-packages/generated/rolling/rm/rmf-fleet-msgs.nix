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
  version = "4.0.0-1";
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
        rev = "11e26f8d641aa1f2e6dbd9938c1a8df7fd761193";
        hash = "sha256-LS62hDlZVCiBx2sT5TZAnQI/MYjDjK2CE/RFm4TWlL0=";
      };
    };
  });
  meta = {
    description = "A package containing messages used to interface to fleet managers";
  };
})
