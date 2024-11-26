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
  pname = "rmf_door_msgs";
  version = "3.4.1-1";
  src = finalAttrs.passthru.sources."rmf_door_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmf_door_msgs" = substituteSource {
        src = fetchgit {
          name = "rmf_door_msgs-source";
          url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
          rev = "a4d365cde948290ed3bea1e19d2f399659278ce5";
          hash = "sha256-r7XQF5PoAeWcDe3kf48K9ed2DsgB8/LjMhWwKPCtzEY=";
        };
      };
    });
  };
  meta = {
    description = "Messages used to interface to doors";
  };
})
