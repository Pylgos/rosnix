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
  version = "0.17.1-1";
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
          rev = "8013b5d9a21161b181346c568df60d37d7aac2fd";
          hash = "sha256-3B93teFzxO0437/wDohxprbq6i18PRBswRfYFL4fBQc=";
        };
      };
    });
  };
  meta = {
    description = "The CMake API for ament_xmllint to check XML file using xmmlint.";
  };
})
