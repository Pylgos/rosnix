{
  ament-cmake,
  ament-cmake-gtest,
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
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."class_loader";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ console-bridge-vendor rcpputils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libconsole-bridge-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ console-bridge-vendor rcpputils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libconsole-bridge-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "class_loader" = substituteSource {
      src = fetchgit {
        name = "class_loader-source";
        url = "https://github.com/ros2-gbp/class_loader-release.git";
        rev = "c4c9b710739b503edf29dec3c34471f594ba9907";
        hash = "sha256-RZIQ+C4BHMdSfHq3gGxsGQd5ySjNGa6Ao7l6yMLPTzc=";
      };
    };
  });
  meta = {
    description = "\n    The class_loader package is a ROS-independent package for loading plugins during runtime and the foundation of the higher level ROS \"pluginlib\" library.\n    class_loader utilizes the host operating system's runtime loader to open runtime libraries (e.g. .so/.dll files), introspect the library for exported plugin classes, and allows users to instantiate objects of these exported classes without the explicit declaration (i.e. header file) for those classes.\n  ";
  };
})
