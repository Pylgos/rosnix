{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  console-bridge-vendor,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcpputils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "class_loader";
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."class_loader";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedBuildInputs = [ console-bridge-vendor rcpputils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libconsole-bridge-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "class_loader" = substituteSource {
      src = fetchgit {
        name = "class_loader-source";
        url = "https://github.com/ros2-gbp/class_loader-release.git";
        rev = "3812dadf48b00ed1b3d9957c50ddb2741bd447b7";
        hash = "sha256-V+6oUSK7M95ihfg1lxWWhZG258UL04cmtUGoh/eQqOI=";
      };
    };
  });
  meta = {
    description = "The class_loader package is a ROS-independent package for loading plugins during runtime and the foundation of the higher level ROS \"pluginlib\" library. class_loader utilizes the host operating system's runtime loader to open runtime libraries (e.g. .so/.dll files), introspect the library for exported plugin classes, and allows users to instantiate objects of these exported classes without the explicit declaration (i.e. header file) for those classes.";
  };
})
