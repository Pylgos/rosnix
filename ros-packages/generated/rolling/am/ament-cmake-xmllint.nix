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
  version = "0.20.1-1";
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
        rev = "8313f929a9a9f0878713f6545e7a6a5ef0f96594";
        hash = "sha256-MrMSgxcZsAMZx4ngl4pbSviDYk1OhX6GQl5El0cXmKw=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_xmllint to check XML file using xmmlint.\n  ";
  };
})
