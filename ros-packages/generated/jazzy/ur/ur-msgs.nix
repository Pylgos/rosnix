{
  action-msgs,
  ament-cmake,
  ament-lint-auto,
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
  pname = "ur_msgs";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."ur_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ur_msgs" = substituteSource {
      src = fetchgit {
        name = "ur_msgs-source";
        url = "https://github.com/ros2-gbp/ur_msgs-release.git";
        rev = "6da1984843d0dcc76dcfa2745f84105fa532d751";
        hash = "sha256-jT9CO82bu9sUQf/pxn2sUyBusFSDvGsAHnK/fiJNVEY=";
      };
    };
  });
  meta = {
    description = "Message and service definitions for interacting with Universal Robots robot controllers.";
  };
})
