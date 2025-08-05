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
  version = "0.20.2-1";
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
        rev = "185d0feb5ea44fe64e2fdaea2211a0b3b5de0242";
        hash = "sha256-awmIQpxlG88ITX9abmQNCA3sbC2vHMYQTH/Evb8yda4=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_xmllint to check XML file using xmmlint.\n  ";
  };
})
