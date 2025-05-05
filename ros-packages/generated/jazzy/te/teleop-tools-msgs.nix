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
  propagatedBuildInputs = [ action-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "teleop_tools_msgs" = substituteSource {
      src = fetchgit {
        name = "teleop_tools_msgs-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "51a8bb8bbf106d1e70cec9ac3c47816490ab9536";
        hash = "sha256-7IXRnpY1cnnQJa+DPlUKVDpD5Lv51CLoQaTMhLZoXvA=";
      };
    };
  });
  meta = {
    description = "The teleop_tools_msgs package";
  };
})
