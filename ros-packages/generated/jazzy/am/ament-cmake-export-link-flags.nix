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
  pname = "ament_cmake_export_link_flags";
  version = "2.5.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_export_link_flags";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_export_link_flags" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_link_flags-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "b4015f73378b2f11194c76a05cc425e58cf5a926";
        hash = "sha256-vpjLsmo6PirL73NMhMciK26tYWpc1YbIU/6+BnXFnVo=";
      };
    };
  });
  meta = {
    description = "The ability to export link flags to downstream packages in the ament buildsystem.";
  };
})
