{
  ament-cmake,
  ament-index-cpp,
  backward-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rig_reconfigure";
  version = "1.6.0-1";
  src = finalAttrs.passthru.sources."rig_reconfigure";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [ ament-index-cpp backward-ros rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libglfw3-dev" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  propagatedBuildInputs = [ ament-index-cpp backward-ros rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libglfw3-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rig_reconfigure" = substituteSource {
      src = fetchgit {
        name = "rig_reconfigure-source";
        url = "https://github.com/ros2-gbp/rig_reconfigure-release.git";
        rev = "c9cb9117b98542929fc706e9911fcc8a3e25787a";
        hash = "sha256-r8yyqZaHFFs02E9nL3MCznOqNCzN6AzuOe0Ndbh2saw=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/ocornut/imgui.git";
          to = "URL ${sources."rig_reconfigure/imgui"}";
        }
      ];
    };
    "rig_reconfigure/imgui" = substituteSource {
      src = fetchgit {
        name = "imgui-source";
        url = "https://github.com/ocornut/imgui.git";
        rev = "f8704cd085c4347f835c21dc12a3951924143872";
        hash = "sha256-eY8lRsonPfDRTMCPhInT9rQ6lSaJPsXpkh428OKpTnA=";
      };
    };
  });
  meta = {
    description = "Standalone GUI tool for editing node parameters at runtime.";
  };
})
