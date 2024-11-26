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
  pname = "rmf_dispenser_msgs";
  version = "3.4.1-1";
  src = finalAttrs.passthru.sources."rmf_dispenser_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmf_dispenser_msgs" = substituteSource {
        src = fetchgit {
          name = "rmf_dispenser_msgs-source";
          url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
          rev = "aac1fdec9a372d19f889a7a721c9bc1b37b683e6";
          hash = "sha256-i18D4bPPnQrjEXISkPv/Zv9CI2XgRe7IdGIL6tcTzlI=";
        };
      };
    });
  };
  meta = {
    description = "A package containing messages used to interface to dispenser workcells";
  };
})
