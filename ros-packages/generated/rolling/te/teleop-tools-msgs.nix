{
  action-msgs,
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
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
  pname = "teleop_tools_msgs";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."teleop_tools_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "teleop_tools_msgs" = substituteSource {
      src = fetchgit {
        name = "teleop_tools_msgs-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "d10d3902bb4fa826294252603aa04159cd049f8b";
        hash = "sha256-7IXRnpY1cnnQJa+DPlUKVDpD5Lv51CLoQaTMhLZoXvA=";
      };
    };
  });
  meta = {
    description = "The teleop_tools_msgs package";
  };
})
