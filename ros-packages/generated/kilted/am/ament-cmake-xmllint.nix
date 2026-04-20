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
  version = "0.19.3-2";
  src = finalAttrs.passthru.sources."ament_cmake_xmllint";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-xmllint ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ament-xmllint ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_xmllint" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_xmllint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "b329acd294264d7a175a7f0bc4d521e0e70d858f";
        hash = "sha256-9CTJC1DCRECXIo5XPNoz/9lhZRDf0ilaHSvF/CtBXck=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_xmllint to check XML file using xmmlint.\n  ";
  };
})
