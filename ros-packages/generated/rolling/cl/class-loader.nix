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
  version = "2.9.4-1";
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
        rev = "91d0ae0ca634fac979d85703a1c428046e66a2d2";
        hash = "sha256-ba3k8TL0RKPx16vj16cMdZfGjJb0uNO9z5Dx4703bJk=";
      };
    };
  });
  meta = {
    description = "\n    The class_loader package is a ROS-independent package for loading plugins during runtime and the foundation of the higher level ROS \"pluginlib\" library.\n    class_loader utilizes the host operating system's runtime loader to open runtime libraries (e.g. .so/.dll files), introspect the library for exported plugin classes, and allows users to instantiate objects of these exported classes without the explicit declaration (i.e. header file) for those classes.\n  ";
  };
})
