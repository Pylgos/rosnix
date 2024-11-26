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
  pname = "rmf_traffic_msgs";
  version = "3.4.1-1";
  src = finalAttrs.passthru.sources."rmf_traffic_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_traffic_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "1a0364e35fceaa52f8c303aa61d5f41e34c4d811";
        hash = "sha256-tTKwbQW/FGl6sSzWj/NjXUPFckXHXM4kh41AwTuu9Fs=";
      };
    };
  });
  meta = {
    description = "A package containing messages used by the RMF traffic management system.";
  };
})
