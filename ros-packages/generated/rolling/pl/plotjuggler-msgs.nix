{
  ament-cmake,
  ament-cmake-gtest,
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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plotjuggler_msgs";
  version = "0.2.3-4";
  src = finalAttrs.passthru.sources."plotjuggler_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "plotjuggler_msgs" = substituteSource {
        src = fetchgit {
          name = "plotjuggler_msgs-source";
          url = "https://github.com/ros2-gbp/plotjuggler_msgs-release.git";
          rev = "2a9c8a2f70e615f842e408e6ca6c4738f3893a11";
          hash = "sha256-Lu4ZRsDpvbS2QzbjWOL23H8lsKRSTPGe6MgiCaUedO4=";
        };
      };
    });
  };
  meta = {
    description = "Special Messages for PlotJuggler";
  };
})
