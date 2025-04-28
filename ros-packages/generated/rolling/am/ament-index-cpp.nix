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
  version = "1.12.0-1";
  src = finalAttrs.passthru.sources."ament_index_cpp";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ament_index_cpp" = substituteSource {
      src = fetchgit {
        name = "ament_index_cpp-source";
        url = "https://github.com/ros2-gbp/ament_index-release.git";
        rev = "79fa8b2a932668a8caee93984e0299ca19797a84";
        hash = "sha256-Rrjc02wMsfoASV5lEkhXEBS8N2hhJcpYa+Z2VFR3seo=";
      };
    };
  });
  meta = {
    description = "C++ API to access the ament resource index.";
  };
})
