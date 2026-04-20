{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-uncrustify,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_uncrustify";
  version = "0.17.5-1";
  src = finalAttrs.passthru.sources."ament_cmake_uncrustify";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-uncrustify ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ament-uncrustify ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_uncrustify" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_uncrustify-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "499e0daa676a7c122eab9f6d3e897c2f098233b2";
        hash = "sha256-P8XzTigq2yguoX74WsYre8d/idVJZ3LKxj6bx8caAsE=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_uncrustify to check code against styleconventions\n    using uncrustify.\n  ";
  };
})
