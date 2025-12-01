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
  version = "0.20.3-1";
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
        rev = "f0c3a92ae5a874fd3f65b4830cb2ae51b53cb64e";
        hash = "sha256-1wWfo1cmSD9uFtMt8FgzyueKbN7EMDuWYDdSmAv6F2M=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_xmllint to check XML file using xmmlint.\n  ";
  };
})
