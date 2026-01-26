{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "foxglove_msgs";
  version = "3.2.4-1";
  src = finalAttrs.passthru.sources."foxglove_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs ros-environment rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs ros-environment rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "foxglove_msgs" = substituteSource {
      src = fetchgit {
        name = "foxglove_msgs-source";
        url = "https://github.com/ros2-gbp/foxglove_bridge-release.git";
        rev = "bcb3fd6f0183491a6a4dd8ca7711243a83f38f7b";
        hash = "sha256-d1NOEVhzfYLCai3kPwdXvIfrGhmIMikRepjZpRx7ADw=";
      };
    };
  });
  meta = {
    description = "\n    foxglove_msgs provides visualization messages that are supported by Foxglove.\n  ";
  };
})
