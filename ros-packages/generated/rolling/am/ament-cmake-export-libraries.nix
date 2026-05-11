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
  pname = "ament_cmake_export_libraries";
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_libraries";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_libraries" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_libraries-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "b9f05436856a67a0182d480708b127c55c5909b1";
        hash = "sha256-CsxkfJFRtpDx2ntRGFcB7uRPz2jARJ8/2Z4xOZ2ylfI=";
      };
    };
  });
  meta = {
    description = "The ability to export libraries to downstream packages in the ament buildsystem in CMake.";
  };
})
