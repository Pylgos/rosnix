{
  ament-cmake-core,
  ament-cmake-gtest,
  ament-package,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_gen_version_h";
  version = "2.5.2-1";
  src = finalAttrs.passthru.sources."ament_cmake_gen_version_h";
  nativeBuildInputs = [ ament-package ];
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  buildInputs = [ ament-package ];
  propagatedBuildInputs = [ ament-cmake-core ];
  checkInputs = [ ament-cmake-gtest ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_gen_version_h" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_gen_version_h-source";
          url = "https://github.com/ros2-gbp/ament_cmake-release.git";
          rev = "a7e9cce7b0c6f8b0600d338112c98fe5cbf1da59";
          hash = "sha256-iM53Ds+Bz5kGrOaojMYc5LUlYCIwksTXl8n7BsYvaAE=";
        };
      };
    });
  };
  meta = {
    description = "Generate a C header containing the version number of the package";
  };
})
