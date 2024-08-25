{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  iceoryx_hoofs,
  iceoryx_posh,
  ncurses,
  substituteSource,
}:
let
  sources = rec {
    iceoryx_introspection = substituteSource {
      src = fetchgit {
        name = "iceoryx_introspection-source";
        url = "https://github.com/ros2-gbp/iceoryx-release.git";
        rev = "8fb32f968a3828199e8fbe8086d9eea445d3942a";
        hash = "sha256-CQJ3hBCcrotZK6RXc42VUx+ZWcAJfXVoSQDC3eKzLi4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "iceoryx_introspection";
  version = "2.0.5-6";
  src = sources.iceoryx_introspection;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ iceoryx_hoofs iceoryx_posh ncurses ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Eclipse iceoryx inter-process-communication (IPC) middleware introspection client";
  };
}
