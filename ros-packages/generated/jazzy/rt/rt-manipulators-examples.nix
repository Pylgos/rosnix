{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rt-manipulators-cpp,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rt_manipulators_examples";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."rt_manipulators_examples";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ rt-manipulators-cpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rt_manipulators_examples" = substituteSource {
      src = fetchgit {
        name = "rt_manipulators_examples-source";
        url = "https://github.com/ros2-gbp/rt_manipulators_cpp-release.git";
        rev = "29b61b471b07224641d91c3b738f6a6985648c12";
        hash = "sha256-cNJsXqsJXtFAM3wNOEyNmybk38Hofq8NrTcUVuOA2HE=";
      };
    };
  });
  meta = {
    description = "Examples for RT Manipulators C++ Library";
  };
})
