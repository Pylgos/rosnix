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
  pname = "asio_cmake_module";
  version = "1.2.0-3";
  src = finalAttrs.passthru.sources."asio_cmake_module";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "asio_cmake_module" = substituteSource {
      src = fetchgit {
        name = "asio_cmake_module-source";
        url = "https://github.com/ros2-gbp/transport_drivers-release.git";
        rev = "116bb101dc0bfc3054c77c7f21c25950f8fe0861";
        hash = "sha256-S4As/gOIQQTIqYgblUDPs2pjBDmLPz4Ii2/CTMHhRUs=";
      };
    };
  });
  meta = {
    description = "A CMake module for using the ASIO network library";
  };
})
