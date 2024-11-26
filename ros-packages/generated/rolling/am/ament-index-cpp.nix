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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_index_cpp";
  version = "1.10.1-1";
  src = finalAttrs.passthru.sources."ament_index_cpp";
  nativeBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ament_index_cpp" = substituteSource {
      src = fetchgit {
        name = "ament_index_cpp-source";
        url = "https://github.com/ros2-gbp/ament_index-release.git";
        rev = "de1404cfe677aacf5068bd9d292438878b4551a6";
        hash = "sha256-0LF3qifb212b9L6iT6qgpuO76NAxT+NGyLGazT4eBJE=";
      };
    };
  });
  meta = {
    description = "C++ API to access the ament resource index.";
  };
})
