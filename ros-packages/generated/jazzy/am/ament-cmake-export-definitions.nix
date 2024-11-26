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
  pname = "ament_cmake_export_definitions";
  version = "2.5.2-1";
  src = finalAttrs.passthru.sources."ament_cmake_export_definitions";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_export_definitions" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_export_definitions-source";
          url = "https://github.com/ros2-gbp/ament_cmake-release.git";
          rev = "d05333c9e98e9d54210b9129da24398da08b5a93";
          hash = "sha256-gjA5vE6MoQRHBoArre5vwo9dhBcSweurSOa5duKj4CM=";
        };
      };
    });
  };
  meta = {
    description = "The ability to export definitions to downstream packages in the ament buildsystem.";
  };
})
