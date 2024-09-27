{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rmf_traffic_editor_assets-f0ef7bdc973db38c071f7e3a43b72b862cd8799e = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_editor_assets-f0ef7bdc973db38c071f7e3a43b72b862cd8799e-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "f0ef7bdc973db38c071f7e3a43b72b862cd8799e";
        hash = "sha256-TrvjKiT+/oazcf8NPW7nprqf5nlc/ue8dQWyOgwNciQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_traffic_editor_assets";
  version = "1.10.0-1";
  src = sources.rmf_traffic_editor_assets-f0ef7bdc973db38c071f7e3a43b72b862cd8799e;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Assets for use with traffic_editor.";
  };
}
