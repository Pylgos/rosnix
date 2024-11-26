{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_xmllint";
  version = "0.19.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_xmllint";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-xmllint ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ament-xmllint ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_xmllint" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_xmllint-source";
          url = "https://github.com/ros2-gbp/ament_lint-release.git";
          rev = "5542a86f0476273919768d8d84ff95fde4a2ce6a";
          hash = "sha256-ig7Xvh7HWh+ODplyw2NSbp2Rn2GjrclDgl+jMQX9xIw=";
        };
      };
    });
  };
  meta = {
    description = "The CMake API for ament_xmllint to check XML file using xmmlint.";
  };
})
