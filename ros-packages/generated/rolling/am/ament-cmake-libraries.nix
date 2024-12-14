{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_libraries";
  version = "2.7.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_libraries";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_libraries" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_libraries-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "03464e00a30dd86d1918de411b538eb390663b9a";
        hash = "sha256-QD6qNU4LpqaiMs8SU/bFXysksUDV/RwUqeMZLVgxHvE=";
      };
    };
  });
  meta = {
    description = "The functionality to deduplicate libraries in the ament buildsystem in CMake.";
  };
})
