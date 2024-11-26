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
  version = "1.0.0-3";
  src = finalAttrs.passthru.sources."rt_manipulators_examples";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rt-manipulators-cpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rt_manipulators_examples" = substituteSource {
        src = fetchgit {
          name = "rt_manipulators_examples-source";
          url = "https://github.com/ros2-gbp/rt_manipulators_cpp-release.git";
          rev = "39e0ef864ab63defcde598d3c0007bba775f4018";
          hash = "sha256-dHVhmshZaD7z/hfD5tLkvXw6mehXEQSlivgKwLZ4YZM=";
        };
      };
    });
  };
  meta = {
    description = "Examples for RT Manipulators C++ Library";
  };
})
